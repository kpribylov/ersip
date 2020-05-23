

# Module ersip_hparams #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

<a name="types"></a>

## Data Types ##




### <a name="type-hparams">hparams()</a> ###


<pre><code>
hparams() = #hparams{order = [<a href="#type-lower_key">lower_key()</a>], orig = #{<a href="#type-lower_key">lower_key()</a> =&gt; {<a href="#type-orig_key">orig_key()</a>, <a href="#type-orig_value">orig_value()</a>}}, parsed = #{<a href="#type-parsed_name">parsed_name()</a> =&gt; {<a href="#type-lower_key">lower_key()</a>, <a href="#type-parsed_value">parsed_value()</a>}, <a href="#type-lower_key">lower_key()</a> =&gt; <a href="#type-parsed_name">parsed_name()</a>}}
</code></pre>




### <a name="type-lower_key">lower_key()</a> ###


<pre><code>
lower_key() = binary()
</code></pre>




### <a name="type-orig_key">orig_key()</a> ###


<pre><code>
orig_key() = binary()
</code></pre>




### <a name="type-orig_value">orig_value()</a> ###


<pre><code>
orig_value() = binary() | novalue
</code></pre>




### <a name="type-parse_known_fun">parse_known_fun()</a> ###


<pre><code>
parse_known_fun() = fun((<a href="#type-lower_key">lower_key()</a>, <a href="#type-orig_value">orig_value()</a>) -&gt; <a href="#type-parse_known_fun_result">parse_known_fun_result()</a>)
</code></pre>




### <a name="type-parse_known_fun_result">parse_known_fun_result()</a> ###


<pre><code>
parse_known_fun_result() = {ok, {<a href="#type-parsed_name">parsed_name()</a>, <a href="#type-parsed_value">parsed_value()</a>}} | {ok, unknown} | {error, term()}
</code></pre>




### <a name="type-parsed_name">parsed_name()</a> ###


<pre><code>
parsed_name() = atom()
</code></pre>




### <a name="type-parsed_value">parsed_value()</a> ###


<pre><code>
parsed_value() = term()
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#assemble-1">assemble/1</a></td><td></td></tr><tr><td valign="top"><a href="#assemble_bin-1">assemble_bin/1</a></td><td></td></tr><tr><td valign="top"><a href="#find-2">find/2</a></td><td></td></tr><tr><td valign="top"><a href="#find_raw-2">find_raw/2</a></td><td></td></tr><tr><td valign="top"><a href="#get-2">get/2</a></td><td></td></tr><tr><td valign="top"><a href="#is_empty-1">is_empty/1</a></td><td></td></tr><tr><td valign="top"><a href="#new-0">new/0</a></td><td></td></tr><tr><td valign="top"><a href="#parse_known-2">parse_known/2</a></td><td>Enrich parameters with parsed values.</td></tr><tr><td valign="top"><a href="#parse_raw-1">parse_raw/1</a></td><td></td></tr><tr><td valign="top"><a href="#set-5">set/5</a></td><td></td></tr><tr><td valign="top"><a href="#set_raw-3">set_raw/3</a></td><td></td></tr><tr><td valign="top"><a href="#to_list-1">to_list/1</a></td><td></td></tr><tr><td valign="top"><a href="#to_raw_list-1">to_raw_list/1</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="assemble-1"></a>

### assemble/1 ###

<pre><code>
assemble(Hparams::<a href="#type-hparams">hparams()</a>) -&gt; iolist()
</code></pre>
<br />

<a name="assemble_bin-1"></a>

### assemble_bin/1 ###

<pre><code>
assemble_bin(Hparams::<a href="#type-hparams">hparams()</a>) -&gt; binary()
</code></pre>
<br />

<a name="find-2"></a>

### find/2 ###

<pre><code>
find(ParsedName::<a href="#type-parsed_name">parsed_name()</a>, Hparams::<a href="#type-hparams">hparams()</a>) -&gt; {ok, <a href="#type-parsed_value">parsed_value()</a>} | not_found
</code></pre>
<br />

<a name="find_raw-2"></a>

### find_raw/2 ###

<pre><code>
find_raw(BinName::<a href="#type-orig_key">orig_key()</a>, Hparams::<a href="#type-hparams">hparams()</a>) -&gt; {ok, <a href="#type-orig_value">orig_value()</a>} | not_found
</code></pre>
<br />

<a name="get-2"></a>

### get/2 ###

<pre><code>
get(Name::<a href="#type-parsed_name">parsed_name()</a> | binary(), Hparams::<a href="#type-hparams">hparams()</a>) -&gt; <a href="#type-parsed_value">parsed_value()</a>
</code></pre>
<br />

<a name="is_empty-1"></a>

### is_empty/1 ###

<pre><code>
is_empty(Hparams::<a href="#type-hparams">hparams()</a>) -&gt; boolean()
</code></pre>
<br />

<a name="new-0"></a>

### new/0 ###

<pre><code>
new() -&gt; <a href="#type-hparams">hparams()</a>
</code></pre>
<br />

<a name="parse_known-2"></a>

### parse_known/2 ###

<pre><code>
parse_known(ParseKnownFun::<a href="#type-parse_known_fun">parse_known_fun()</a>, Hparams::<a href="#type-hparams">hparams()</a>) -&gt; {ok, <a href="#type-hparams">hparams()</a>} | {error, term()}
</code></pre>
<br />

Enrich parameters with parsed values.  ParseKnownFun should
return result of the parameter parsing (see type definition).

<a name="parse_raw-1"></a>

### parse_raw/1 ###

<pre><code>
parse_raw(Binary::binary()) -&gt; <a href="ersip_parser_aux.md#type-parse_result">ersip_parser_aux:parse_result</a>(<a href="#type-hparams">hparams()</a>)
</code></pre>
<br />

<a name="set-5"></a>

### set/5 ###

<pre><code>
set(ParsedName::<a href="#type-parsed_name">parsed_name()</a>, ParsedValue::<a href="#type-parsed_value">parsed_value()</a>, Key::<a href="#type-orig_key">orig_key()</a>, Value::<a href="#type-orig_value">orig_value()</a>, Hparams::<a href="#type-hparams">hparams()</a>) -&gt; <a href="#type-hparams">hparams()</a>
</code></pre>
<br />

<a name="set_raw-3"></a>

### set_raw/3 ###

<pre><code>
set_raw(Key::<a href="#type-orig_key">orig_key()</a>, Value::<a href="#type-orig_value">orig_value()</a>, Hparams::<a href="#type-hparams">hparams()</a>) -&gt; <a href="#type-hparams">hparams()</a>
</code></pre>
<br />

<a name="to_list-1"></a>

### to_list/1 ###

<pre><code>
to_list(Hparams::<a href="#type-hparams">hparams()</a>) -&gt; Result
</code></pre>

<ul class="definitions"><li><code>Result = [Item]</code></li><li><code>Item = {<a href="#type-parsed_name">parsed_name()</a>, <a href="#type-parsed_value">parsed_value()</a>} | {<a href="#type-lower_key">lower_key()</a>, <a href="#type-orig_value">orig_value()</a>}</code></li></ul>

<a name="to_raw_list-1"></a>

### to_raw_list/1 ###

<pre><code>
to_raw_list(Hparams::<a href="#type-hparams">hparams()</a>) -&gt; [{binary(), binary()} | binary()]
</code></pre>
<br />
