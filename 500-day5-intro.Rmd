---
title: "Day 5 - building workflows, loops, using packages, and finding help in new areas"
---

# Day 5 - workflows, loops, packages, and help

*Important links*:

- [The Syllabus / Notes](https://darachm.github.io/dll-r/index.html) - you are here!
- [The Worksheet for Day 5](https://github.com/darachm/dll-r/raw/main/worksheets/dll-r_Day5_Lab.Rmd) - save it, 
    and open it from inside RStudio ( control/combo + o key, usually). 
    You can also go [here](https://github.com/darachm/dll-r/blob/main/worksheets/dll-r_Day5_Lab.Rmd)
    and then click "Raw", and save that as a file. Open that inside Rstudio.

<!--
- [The Document of Honourable Errors](https://docs.google.com/document/d/1s8PI8TzC3OD6FrvZYfjr44tNDypXfZ7rZxdQ3AwFBTI/edit?usp=sharing) - errors are cool and useful! 
    Put any error messages you find on here, so we can check out those cool errors together
-->

<img src="https://media.giphy.com/media/12qq4Em3MVuwJW/giphy.gif" width="400"/>

Today we're going to learn about applying R skills to 
repeat, reproduce, extend, and share your analyses.

<!-- exercise -->

<!--are we trying to make students think about writing functions and clean code? I'm not sure that's clear if this is asynchronous reading-->

Here's some broad questions to reflect on the previous two days:

- Crack open your code - can you use it again?
- Can you adapt it to modify your question, 
  feed in new data, and modify the
  scientifically-important bits easily?
- Can you share it with someone and they follow
  along?

---

Our goals are to learn:

- Why and how to organize work in a folder and rmarkdown files
- How look at character strings, to look for patterns and calculate lengths of strings
- Why and how to write loops to do many analyses in a scalable way
- What packages are for, how to find them, and how to install them
- How to find help and tackle new problems with a learning community

---

**Preparing for Today:**
Please make sure you have completed all readings and activities from 
the previous days. If you have not found the time to do so, go ahead and join
us to start on this material today.

This site will stay up for at least several months (if not years), so these
notes and worksheets (and us!) will be available long after.


**Today's Schedule:**

| Start Time | End Time | Activity |   Description   | Facilitator |
| ------------- | ----------- | ------------- | ----------------------------- | --------------- |
| 10:00 AM PDT | 10:15 AM PDT | Synchronous - lecture | 4.1 organizing workflows | **Darach**, Melissa, Samson, Margaret, Zac |
| 10:15 AM PDT | 10:45 AM PDT | Synchronous - breakout rooms, then lecture | 4.1 exercises | **Darach**, Melissa, Samson, Margaret, Zac |
| 10:45 AM PDT | 12:15 PM PDT | Asynchronous - video, slack, etc | 4.2 Project - analyze viral protein sequences | Darach, Samson, Margaret, Zac |
| 12:15 PM PDT | 12:30 PM PDT | Synchronous - lecture | 4.2 Modular, extendable workflows | **Darach**, Melissa, Samson, Margaret |
| 12:30 PM PDT | 01:00 PM PDT | Break | Lunch. Take a computer break!  |  N/A  |
| 01:00 PM PDT | 01:15 PM PDT | Synchronous - lecture | 4.3 Packages - why and how | **Darach**, Samson, Margaret, Zac |
| 01:15 PM PDT | 02:00 PM PDT | Asynchronous - video, slack, etc | 4.3 exericses | Darach, Samson, Margaret, Zac |
| 02:00 PM PDT | 02:30 PM PDT | Synchronous - lecture | 4.4 Demo/discuss some places to find help | **Darach**, Samson, Margaret |
| 02:30 PM PDT | 02:45 PM PDT | Break | Take a computer break!  |  N/A  |
| 02:45 PM PDT | 03:15 PM PDT | Synchronous - groups | 4.4 projects - attempt ambitious tutorials | **Darach**, Samson, Margaret, Zac |
| 03:15 PM PDT | 03:30 PM PDT | Synchronous - lecture | 4.5 Wrapping up | **Darach**, Samson, Margaret, Zac |

<!-- -->

