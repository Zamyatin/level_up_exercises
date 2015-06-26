Comments lie more often than not, simply because they go 'stale'.  This of course implies that comments lie while code doesn't.  [Some like to point out][1] that code is just as capable of lying, but to me these 'lies are usually the result of other coding failures - bad variable or method names, poor design choices, long and overly-complicated methods, etc.

I've also seen instances where comments in code have left me with mixed feelings; particularly in projects that have little-to-no time or completion requirements (Open Source projects, I'm looking at you!). It's understandable that some newer developers (myself included) would insert some pseudocode and hope that some more senior developer will help you out.  However once that psuedocode has served its purpose, it should *definintely* be removed from final code base.  Ideally, your code should be written to fit that 5-second rule.

Finally, I've [found an interesting][2] list of 'acceptable' types of commentary.  I appreciated the author's differentiation between 'What' and 'Why'.  
- What: Specifically, *what* the code is doing, what is its purpose?  'What' comments describe the code itself at an abstraction level.  The only code-level information that is usually present are those that the language is not capable of describing (for PHP, this can be scalar parameters, return types, what exceptions are thrown, etc).
- Why: *Why is the code written like this. Why does it look the way it does. Why didn't we do it another way.*  These are primarily design decisions, so quite often they fall into the realm of a DocBlock-style comment, or something that does something odd or atypical with the language.  *Why* comments describe **above** the code-level.

Ironically, even design decisions become stale.  Since code is not ever actually *run* by the compiler, it's never really tested until someone comes across it, reads it, realizes it's garbage or out-of-date, and deletes it.  So, I suppose, the irony here is that I'm still writing up human-readable but uncompilable code, and totally intend to make a Pull Request on it. :)

[1]: http://possibility.com/blog/content/code-lies-much-comments-do
[2]: http://blog.ircmaxell.com/2012/06/to-comment-or-not-to-comment-tale-of.html
