Who’s Who App for theappbusiness.com
=======

So apparently my code was too bad for the following reasons:
He mixes responsibilities too much. 
Uses iVara directly. Extremely bad for testing but in general a big no no. 
Performs non-layout code in layout.

well ... shame, when you have three hours to do something like that.






Repository contains submodule, please make sure you initialise it properly when cloning the project.

Time of dev: 4h

Space for improvements:
- Saving data / images to core data (possibly resizing thumbnails if the image exceeds certain size)
- Full TDD (I was unable to do any proper tests in a given 4h window)
- Use AFNetworking or NSUrlRequest to retrieve data
- Error handling
- Higher queue priorities for data (HTML)
- Unify GDC thread management to be handled from data source classes only
- Not using HTML! :)

