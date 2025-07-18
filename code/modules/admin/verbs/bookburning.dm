/client/proc/manage_player_books()
	set name = "Manage Player Books"
	set category = "GameMaster"
	set desc = "View and delete player-generated books."

	if(!check_rights(R_ADMIN))
		return

	var/list/book_titles = SSlibrarian.pull_player_book_titles()
	if(!book_titles || !book_titles.len)
		to_chat(src, span_warning("No player-generated books found."))
		return

	var/selected_title = input(src, "Select a book to manage", "Manage Player Books") as null|anything in book_titles
	if(!selected_title)
		return

	var/book_data = SSlibrarian.file2playerbook(selected_title)
	if(!book_data || !book_data["book_title"])
		to_chat(src, span_warning("Failed to load book data for '[selected_title]'."))
		return

	var/dat = {"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">
		<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><style type=\"text/css\">
				body { background-image:url('book.png');background-repeat: repeat; }</style></head><body scroll=yes>
				<h3>[book_data["book_title"]]</h3>
				<p><b>Author:</b> [book_data["author"]]</p>
				<p><b>Author CKey:</b> [book_data["author_ckey"]]</p>
				<p><b>Icon:</b> [book_data["icon"]]</p>
				<p><b>Content:</b><br>[book_data["text"]]</p>
				<a href='?src=[REF(src)];manage_books_action=delete_book;book_title=[url_encode(selected_title)]'>Delete Book</a>
				<br><a href='?src=[REF(src)];manage_books_action=refresh'>Back to List</a>
				<br><a href='?src=[REF(src)];manage_books_action=close'>Close</a>
				</body></html>"}
	usr << browse(dat, "window=book_management;size=1000x700;can_close=1;can_minimize=0;can_maximize=0;can_resize=0;titlebar=0")
