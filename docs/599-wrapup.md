## Conclusion

Today we covered:

- loops to repeat code
- aspects of nice (re)usable code
- writing code modularly with functions
- finding and using packages
- writing an Rmarkdown report
- finding help and tackling a complex problem

We hope you are better oriented and prepared to
repeat your analyses to build a complete story,
reproduce these larger analyses workflows, 
extend from your work to do more complicated 
workflows,
and share your analyses with others in a 
well-organized but complete way.

You can extend on these ideas. Here's a couple of 
areas that might be useful:

Workflow / pipeline tools
:   These are automation tools to smartly run 
    different chunks of analyses. This is really 
    handy when parts of your workflow take a 
    long time, and you usually don't want to be  
    re-running those, but you do want it to be
    able to run the whole thing automatically.

    You can use old-school shell-like tools such
    as "[Make/Makefiles](https://makefiletutorial.com/)", 
    newfangled but complex tools
    like "Nextflow" 
    or "snakemake",
    or R-specific tooks like 
    "[targets](https://books.ropensci.org/targets/walkthrough.html)".