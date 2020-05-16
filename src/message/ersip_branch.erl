%%%
%%% Copyright (c) 2018, 2020 Dmitry Poroh
%%% All rights reserved.
%%% Distributed under the terms of the MIT License. See the LICENSE file.
%%%
%%% @doc
%%% SIP branch related functions
%%%

-module(ersip_branch).

-export([make/1,
         make_rfc3261/1,
         make_random/1,
         make_key/1,
         assemble/1,
         assemble_bin/1,
         is_rfc3261/1
        ]).

%%===================================================================
%% Types
%%===================================================================

-type branch()     :: {branch, binary()}.
-type branch_key() :: {branch_key, binary()}.

-export_type([branch/0,
              branch_key/0
             ]).
%%===================================================================
%% API
%%===================================================================

%% @doc Create branch from binary.
%% Raises error if parameter cannot be accepted as branch.
%% Examples:
%% ```
%%   Branch = ersip_branch:make(<<"z9hG4bKmCy89eBuJlR1GMv">>)
%%   ersip_branch:make(<<"1,2">>). % => raises error
%% '''
-spec make(binary()) -> branch().
make(Bin) when is_binary(Bin) ->
    case ersip_parser_aux:check_token(Bin) of
        true -> {branch, Bin};
        false -> error({invalid_branch, Bin})
    end.

%% @doc Create RFC3261-compatible (with magic-cookie) branch from binary.
%% Raises error if parameter cannot be accepted as branch.
%% Examples:
%% ```
%%   Branch = ersip_branch:make(<<"Cy89eBuJlR1GMv">>),
%%   Branch = ersip_branch:make(<<"z9hG4bKCy89eBuJlR1GMv">>). % The same as above
%%   ersip_branch:make_rfc3261(<<"1,2">>). % => raises error
%% '''
-spec make_rfc3261(binary()) -> branch().
make_rfc3261(Bin) ->
    case is_rfc3261({branch, Bin}) of
        true -> make(Bin);
        false -> make(<<"z9hG4bK", Bin/binary>>)
    end.

%% @doc Create random RFC3261-compatible branch.
%% @param NumBytes defines number bits of entropy that used in random.
-spec make_random(NumBytes :: pos_integer()) -> branch().
make_random(NumBytes) ->
    make_rfc3261(ersip_id:alphanum(crypto:strong_rand_bytes(NumBytes))).

%% @doc Create comparable key for branch parameter.
%% After make_key(Branch) can be used in ets/maps as key to find
%% transaction.
-spec make_key(branch()) -> branch_key().
make_key({branch, Bin}) ->
    {branch_key, ersip_bin:to_lower(Bin)};
make_key({branch_key, _} = Key) ->
    Key.

%% @doc Serialize header to iolist.
-spec assemble(branch()) -> binary().
assemble({branch, Bin}) ->
    Bin.

%% @doc Serialize header to binary.
-spec assemble_bin(branch()) -> binary().
assemble_bin({branch, Bin}) ->
    Bin.

%% @doc Check that branch was generated by RFC3261-compatible
%% implementation (has z9hG4bK magic cookie).
-spec is_rfc3261(branch() | branch_key()) -> boolean().
is_rfc3261({branch, <<"z9hG4bK", _/binary>>}) ->
    true;
is_rfc3261({branch_key, <<"z9hg4bk", _/binary>>}) ->
    true;
is_rfc3261({branch, _}) ->
    false;
is_rfc3261({branch_key, _}) ->
    false.

