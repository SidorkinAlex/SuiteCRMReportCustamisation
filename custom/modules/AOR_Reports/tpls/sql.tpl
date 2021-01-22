<script src="custom/modules/AOR_Reports/js/sql-formatter.min.js" ></script>
{literal}
    <script>
        $(document).ready(function () {
            var html=sqlFormatter.format("{/literal}{$sql}{literal}");
            console.log(html);
           $('#sql').text(html);
        });
    </script>
{/literal}
<pre id="sql">
</pre>