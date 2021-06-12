## Getting help - troubleshooting

You will have problems.
Virtually all of these problems will have been encountered by someone before,
and most of these workarounds will be findable online.

How do you (1) find a way past these problems and (2) learn from them?

What kinds of errors did we encounter in this class?

How do we deal with these?

1. General help - problems of not knowing where to start, 
    what tool is even possible to use
1. Specific debugging - problems of not knowing how to do something, 
    use a tool correctly

---

### Where to start? General help

For the first, you can ask for ideas in a few places:

- Typing your question into a text search engine (like google) will likely 
    give you many ideas and ways forward. As you become more experienced
    and better understand the programming concepts behind this work, 
    you will better able to ask more specific and powerful questions
    (and ask questions that get past the basic search-engine optimized
    commercial sites).

- If you don't know how to ask, or wonder if there's a better or alternative
    approach, then asking friends, advisors, mentors, or just about anyone
    can help. You can also just blast it out on twitter - that actually works
    sometimes.

    Someone may know the answer, or know a tangentially related fact
    that may be relavant, or simply the process of explaining your problem
    often helps you sharpen your thoughts and think about things in a new way.

---

### Debugging specific problems

You will often be trying to do something, and get specific errors as your
implementation of your idea fails to work.
Getting help in this way is best approached by debugging.
Debugging is a term that means troubleshooting specific errors in your
programming project.

These are valuable opportunities. 
Never waste an error message, if you can afford the time to. 
Cherish the bugs, because these moments of surprise are like
mutants - the strange and unexpected behavior, if appreciated, can reveal
hidden processes.
The process of gaining understanding will make you wiser and faster
^[Some bugs may be 
["impossible"](https://jvns.ca/blog/2021/06/08/reasons-why-bugs-might-feel-impossible/),
but these are rare.].

If you can't find an easy answer, it is important to begin to approach the
problem like you would a science problem.
Reduce the problem, eliminate extraneous variables.
Use or capture intermediate steps to identify where the issue is
(try putting lots of `print(x)` functions in your code to print out what
variables are inbetween functions/calls/loops).

---

There are several things to try:

- First, read the error message. As you become more experienced and familiar
    with programming concepts, you will learn to be able to understand what
    is actually being said. 

    For example, if it complains that a value is numeric instead of character,
    you may have saved it as a numeric value. If it is in the context of
    some characters getting put into a `data.frame`, you may have forgotten
    to use `as.is=T` or `stringsAsFactors=F` to prevent character strings from
    being converted to factors, which get converted to integers.

- Error messages may be more complex, where you can't understand them.
    One approach is to simply copy and paste portions or entire error messages
    into text search enginges, like Google or DuckDuckGo.
    Often, this will find places online where others have asked for help.

    There can be solutions to the problem, or there can be more information
    that may help you debug the problem.

- If you can't find a way to solve a specific problem in this way, it makes
    a lot of sense to "get unstuck" and bug your friends, co-workers,
    and advisors. The best help will explain the problem, and/or be able to 
    tell you what concept you need to read about to understand what the
    error is.

    Or hey, use the Slack !

---

- If this doesn't work, you can also ask questions online.

    - One very common place is StackOverflow. You'll need to have an account.
        Make sure to have researched the problem to be reasonably sure you're 
        not asking a duplicate question. The people answering are volunteers.

    - If you're using a specific package or tool, you can often ask these
        questions in the "Issues" page on the git repo for the tool.
        Most tools will be on a git repo, either GitHub, GitLab, or BitBucket.
        For example, feel free to 
        ["open an issue" on the repo for this site](https://github.com/darachm/dll-r/issues).

    - There are specific sites for other areas.
        [Biostars](https://www.biostars.org/) is one similar to StackOverflow,
        for bioinformatics.

    - You can also blast it out on twitter. People will probably help.


---

### Minimal reproducible examples

Often, people will be much better able (and willing) to help you if you have
done the work of making the problem simpler.
This is often achieved by creating a "minimal reproducible example"
This means it's an example, that reproduces the problem, but it's as simple
and minimal as possible (to still get the error).
This is a useful exercise for you to do, as you may use it to find a
way forward without ever asking someone.

To do this:

- Identify as best you can where the problem is - a specific script, 
    code chunk, code block, line, variable?
- Make a copy of your code where you can make a really minimal version of this.
- In that minimal copy, cut out everything that doesn't affect the generation
    of that error. Remove all extra metadata, extra plots, extra libraries,
    anything that is not necessary to get to the error.
- If you have a big dataset, figure out if you can reproduce the error with
    a smaller dataset - is it just one record that creates the error?
    Use tools and ideas from Day1/2 to do this, or select only certain
    problematic rows.
- Figure out if it is possible to upload the minimal data and minimal script 
    somewhere (respecting HIPAA!), so that others can have an example they
    can work on to help you.
- Remember to include packages, and the output of `sessionInfo()`.

---

#### Some problems to work through in groups

Let's split into groups, and work through some of these problems.
These are designed to be somewhat challenging, having to use new functionality.
They should be doable, even if you're just copy and pasting, but you've got
to know what to copy and paste, in what order, and how to solve errors that
come up.

You should approach these problems as a group. Work together, make sure
everyone is moving along nicely.
If you're having trouble, ask for help from your peers.
If you've got the prior background where you're already familiar with this,
and are picking up on it quickly, then take the time to help your peers learn.
Teaching is learning, and building a learning community has benefits for all
participants.

Science depends upon it.

Take the time to discuss what each step is doing. Try to learn from the example
code. Also, ask instructors for help explaining it!

Multi-panel figures
: Claus Wilke's [cowplot](https://cran.r-project.org/web/packages/cowplot/vignettes/introduction.html)
    package is a great way to make multi-panel figures with ggplot.
    Install it and use this to make a multi-panel figure exploring the
    iris dataset from yesterday. Take the multiple kinds of plots, and
    arrange them into whatever single figure looks good.

SARS2 antibody escape data analysis
: Starr et al Bloom used the Awesome Power Of Yeast Genetics to map
    SARS-CoV-2 antibody escape probabilities early on in the pandemic.
    Download the dataset [here](https://science.sciencemag.org/content/371/6531/850/tab-figures-data),
    read it in, and analyze it.
    Consider making a heatmap using `geom_tile`, and grouping/aggregating
    the data by amino acid types, or antibodies added.

Differential expression analysis with DESeq2
: Love, Andres, and Huber's DESeq2 package is a well used and highly respected
    package for doing differential expression of counts data, for RNAseq
    (bulk and sc) or barseq or whatever, it's pretty handy.
    Attempt to work through [the tutorial](https://www.bioconductor.org/packages/devel/bioc/vignettes/DESeq2/inst/doc/DESeq2.html#count-matrix-input), 
    I recommend starting with the count data from the `pasilla` package.
    The idea is that you're doing DE analysis on RNAseq from a Drosophila
    RNAi knockdown of the pasilla gene, to see what that gene's expression 
    affects expression of.
    The tutorial is a bit tangled, so work as a team to follow and pick 
    through it.


Other ones? If you have an idea, propose it and maybe there's a group that
wants to attempt it. Keep it to be things you can readily do in R.

#### First conclusion

Generally, approach these problems as you would a scientist.
Treat them with respect and an open mind.
Reduce the problem, measure what is going on before/around the error,
develop a theory about what is going on, and test that idea.
Ask for help and ideas from friends and colleagues.

And if it's a problem that doesn't have a readily available solution,
consider writing it up on a blog or site like StackOverflow!

---

