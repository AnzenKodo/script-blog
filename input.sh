# !/bin/bash

# Checks the markdown install or not

if ! [ -x "$(command -v markdown)" ]; then
	tput setaf 1
	echo "Error: markdown is not installed"
	tput sgr0
	echo "Install it by entering this command:"
	echo "\nsudo apt install markdown\n"
	exit
fi

# Variable

name="Filly Agioro Blog"
title=$(printf '%s\n' "${i%}" | cut -f 1 -d '.' | cut -b 7-)

# The main functions

head() {
	cat <<-_EOF_
		<title>$name Blog - $title</title>

		<!--meta tag-->
		<meta name="description" content="This is my personal website which shows information about me.">
		<meta name="theme-color" content="#00eab5z">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="msapplication-TileColor" content="#2b5797">

		<!-- link tag-->
		<link rel="apple-touch-icon" sizes="180x180" href="/dist/logo/apple-touch-icon.png" />
		<link rel="icon" type="image/png" sizes="32x32" href="/dist/logo/favicon-32x32.png" />
		<link rel="icon" type="image/png" sizes="16x16" href="/dist/logo/favicon-16x16.png" />
		<link rel="manifest" href="manifest.json" />
		<link rel="preload" href="/dist/style.css" as="style">
		<link rel="stylesheet" href="/dist/style.min.css">
	_EOF_
	return
}

footer() {
	cat <<-_EOF_
		</article>
		<footer>
		<p>@<a href="https://fillyagioro.vercel.app/">$name</a> under <a href="https://github.com/FillyAgioro/script-blog/blob/master/LICENSE">GPL 3.0</a> | <a href="https://github.com/FillyAgioro/script-blog">Website Source</a></p>
		</footer>
		</section>
	_EOF_
	return
}

# index.html functions

index() {

	cat <<-_EOF_
		<section class="center">
		<main>
		<h1>$name</h1>
		</main>
		<article class="content">
	_EOF_

	# Main compontent of index.html
	for i in posts/*.md; do
		title=$(printf '%s\n' "${i%}" | cut -f 1 -d '.' | cut -b 7-)
		file_title=$(printf '%s\n' "${i%}" | cut -f 1 -d '.')
		cat <<-_EOF_
			<p><a href="/dist/$file_title.html">$title</a></p>
		_EOF_
	done
	return
}

index_main() {
	cat <<-_EOF_
		<html lang="en">
		<head>
			$(head)
		<head>
		<body>
			$(index)
		   $(footer)
		</body>
		</html>
	_EOF_
}
echo "$(index_main)" >index.html

# Posts functions

for i in posts/*.md; do

	title=$(printf '%s\n' "${i%}" | cut -f 1 -d '.' | cut -b 7-)
	file_title=$(printf '%s\n' "${i%}" | cut -f 1 -d '.')
	date=$(date -I -r $i)

	posts_main() {
		cat <<-_EOF_
			<html lang="en">
			<head>
			$(head)
			<head>
			<body>

			<section class="center">
			<main>
			<h1>$name</h1>
			<h2>$title</h2>
			<p>Published on <time datetime=$date>$date</time></p>
			</main>
			<article class="content">

			$(markdown $i)

			$(footer)
			</body>
			</html>
		_EOF_
		return
	}

	echo "$(posts_main)" >dist/$file_title.html
done

# RSS functions

rss() {
	
	cat <<- _EOF_
	<?xml version="1.0" encoding="UTF-8" ?>
	<rss version="2.0">

	<channel>
	
	_EOF_	

	for i in posts/*.md; do

		

	done

}
