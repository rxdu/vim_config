# Cheat Sheet

## Vim

<style>
td, th {
   border: none!important;
}
</style>

|                 |                                 |
| :-------------: | :-----------------------------: |
|    **Move**     |                                 |
|     h j k l     |           Arrow keys            |
| \<C-b> / \<C-f> | Page up/down  (by full screen)  |
| \<C-d> / \<C-u> |  Page up/down (by half screen)  |
|        }        |   jump to next function/block   |
|        {        | jump to previous function/block |
|    **Line**     |                                 |
|    0 (zero)     |          Start of line          |
|        $        |           End of line           |
|       :n        |          Go to line n           |
|   **Search**    |                                 |
|        /        |         Search forward          |
|        ?        |         Search backward         |
|   /\\\<XYZ\\>   |    Search wholte word "XYZ"     |
|     /XYZ \c     |  Search "XYZ" and ignore case   |
|        n        |  Next matching search pattern   |
|        N        |         Previous match          |
|   **Editing**   |                                 |
|        u        |          Undo changes           |
|     \<C-R\>     |          Redo changes           |
|        x        |        Delete character         |
|       dd        |        Delete line (Cut)        |
|       yy        |        Yank line (Copy)         |
|        p        |              Paste              |
|        P        |          Paste before           |

## Plugin

* Invoke clang-format:
```
:ClangFormat
```

* C-support
```
\cc		# code to comment //
\co		# comment // to code
```

* Tags
```
ctrl+]	# jump to tag
ctrl+t	# return from tag
```

* CtrlP
```
ctrl+p	# invoke CtrlP in file find mode
f5			# purge cache
ctrl+f/b 	# cycle between modes
ctrl+j/k	# navigate the result list
ctrl+t/v 	# open the selected entry in a new tab or split
```

* TagBar
```
f8		# open the tag list
```


## Reference

* https://devhints.io/vim
* https://vim.rtorr.com/
