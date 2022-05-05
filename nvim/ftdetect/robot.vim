"=============================================================================
" File:         ftdetect/robot.vim
" Author:       Michael Foukarakis
" Version:      0.2
" Created:      Tue 21 Dec 2010 09:08:35 AM EET
" Last Update:  Sat Sep 14, 2013 10:53 BST
"------------------------------------------------------------------------
" Description:
"   Filetype detection plugin for Robot files.
" WARNING:
"   Overrides all default file type checks.
"------------------------------------------------------------------------
" Installation:
"   - Requires Vim7+
"   - Drop this file into {rtp}/ftdetect
"   - Use the '# -*- coding: robot -*-' in the first line of robot files
"     or set the g:robot_syntax_for_txt global variable
"     to explicitly tell vim about filetype.
" History:      - Replaced setf with setlocal filetype, much more sane.
" TODO:         Missing features go here.
"=============================================================================
let s:cpo_save=&cpo
set cpo&vim

" No resorting to heuristics for .robot files:
au BufNewFile,BufRead *.robot setlocal filetype=robot
au BufNewFile,BufRead *.resource setlocal filetype=robot

"------------------------------------------------------------------------
let &cpo=s:cpo_save
" vim700: set fdm=marker:
