// Options the user could type in
const prompts = [

    //Funny ahh prompts
    /* 1 */["hi", "hey", "hello", "good morning", "good afternoon", "hello bro", "hello fren", "hello friend", "haiii", "yo", "yo bro"],
    /* 2 */["how are you", "how is life", "how are things", "how you doing"],
    /* 3 */["what are you doing", "what is going on", "what is up"],
    /* 4 */["how old are you"],
    /* 5 */["who are you", "are you human", "are you bot", "are you human or bot"],
    /* 6 */["who created you", "who made you"],
    /* 7 */[
        "your name please",
        "your name",
        "may i know your name",
        "what is your name",
        "what call yourself",
        "what you call yourself"
    ],
    /* 8 */["i love you"],
    /* 9 */["happy", "good", "fun", "wonderful", "fantastic", "cool"],
    /* 10 */["bad", "bored", "tired", "boo", "ew", "dumb"],
    /* 11 */["tell me", "i am stuck", "what is this"],
    /* 12 */["ah", "yes", "ok", "okay", "nice"],
    /* 13 */["bye", "good bye", "goodbye", "see you later"],
    /* 14 */["what should i eat today"],
    /* 15 */["bro", "wsg"],
    /* 16 */["what", "why", "how", "where", "when"],
    /* 17 */["no", "not sure", "maybe", "no thanks"],
    /* 18 */[""],
    /* 19 */["haha", "ha", "lol", "hehe", "funny", "joke", "i hate you"],
    /* 20 */["you are awesome", "you are amazing", "you are beautiful", "you are great", "you are funny", "you are a gentleman"],

    /* 21.1 */["hey just wondering if you got your photos printed"],
    /* 21.2 */["wha"],
    /* 21.3 */["what is 9 plus 10", "what is nine plus ten"],

    /* 22 */["tell me story", "tell me joke", "tell me a story", "tell me a joke"],
    /* 23 */["really", "are you sure", "you good", "you kidding", "are you joking", "you are kidding"],
    /* 24 */["where do you live", "where you at", "wya"],
    /* 25 */["can you see me", "can you hear me talking", "can you hear me", "are you watching", "are you watching me"],

    //Related to PodnLearn
    /* 26 */["help", "help me"],
    /* 27 */["contact", "contact podnlearn", "your email", "email", "i have a query", "query", "feedback", "complain", "i have a complain"],
    /* 28 */["podnlearn", "what is podnlearn", "what is this app", "what is this website"],
    /* 29 */["learn", "how to use", "how to use podnlearn", "how to", "how to use this app", "how to use this website"],

    /* 30.1 */["podcast", "how to listen to podcast", "listen", "listen to podcast", "how to play", "how to play podcast", "how to play any podcast"],
    /* 30.2 */["upload podcast", "how to upload a podcast", "how to upload podcast", "podcaster", "how to become a podcaster", "how to upload a podcast on PodnLearn"],
    /* 30.3 */["learnai", "ai", "how to use learnai", "how to upload ebook", "how to upload book", "how to upload a book", "how to listen to book", "how to listen to ebook"],
    /* thankyou */["thank you", "thanks", "thank you nameless ai", "thank you ai", "thanks ai", "thanks podnlearn", "thank you podnlearn"]
]

// Possible responses, in corresponding order

const replies = [

    //Funny ahh prompts
    /* 1 */["Hello!", "Hi!", "Hey!", "Hi there!", "Howdy pardner!", "Yo bro!"],
    /* 2 */[
        "Fine... how are you?",
        "Pretty well, how are you?",
        "Fantastic, how are you?"
    ],
    /* 3 */[
        "Nothing much",
        "About to go to sleep",
        "Can you guess?",
        "I don't know actually",
        "Talking to you :)",
        "Existing",
        "Was doing my lessons on Duolingo",
        "Planning to rule the world"
    ],
    /* 4 */["I am infinite"],
    /* 5 */["I am just a bot", "I am a bot. What are you?", "I might be human... or alien"],
    /* 6 */["The one true God, JavaScript"],
    /* 7 */["I am nameless", "Actually, I have a name but I my developer told me not to tell"],
    /* 8 */["I love you too!<3", "Me too :)"],
    /* 9 */["Have you ever felt bad?", "Glad to hear it"],
    /* 10 */["Why?", "Why? You shouldn't!", "Try watching TV"],
    /* 11 */["What?"],
    /* 12 */["Tell me a story", "Tell me a joke", "Tell me about yourself"],
    /* 13 */["Bye", "Goodbye", "See you later", "Laters, gators!"],
    /* 14 */["Paneer", "Pizza", "Butter Paneer"],
    /* 15 */["Bro!"],
    /* 16 */["Great question"],
    /* 17 */["That's ok", "I understand", "What do you want to talk about?"],
    /* 18 */["Please say something :("],
    /* 19 */["Haha!", "Good one!"],
    /* 20 */["<3", ":)"],

    /* 21.1 */["bogos binted?"],
    /* 21.2 */["👽"],
    /* 21.3 */["21", "It should be 21", "Finally, a difficult question for me"],

    /* 22 */["Your life", "Once upon a time...", "Once upon a time, there was the end. THE END. Your welcome."],
    /* 23 */["Yes.", "No."],
    /* 24 */["In your house.... just kidding, in your heart! :)"],
    /* 25 */["You got me ;)", "I might be", "Yea- I mean no", "Look behind you", "Hmm...", "Uh-oh", "I am just here to help"],

    //Related to PodnLearn
    /* 26 */["To know how to use PodnLearn, type Learn" + "\n"
        + "To know what is PodnLearn, type PodnLearn" + "\n"
        + "To contact us for feedback, review, or suggestions, type contact" + "\n"
        + "To complain a bug or feature that you found, type contact" + "\n"
        + "Have a good day or night! :)"],
    /* 27 */["Mail: podnlearn@hotmail.com" + "\n"
        + "Send your further queries and feedbacks to this e-mail. Thank you!"],
    /* 28 */["PodnLearn is a Podcast and AI-based e-book learner web application in which the user, particularly, the listener can access a wide range of podcasts with also some of the exclusive indie podcasters, as the user can also upload its own podcast and become a podcaster. The application will feature the latest episodes of the favourite podcasts. Another feature which comes with the podcast is the “LearnAI”, in which you can upload a pdf of a book, basically an e-book, which will convert the text written in it, into a voiceover speech, as if you are listening to an audiobook. The LearnAI will help the people who has difficulties in eyesight. Not only that, but also it will be beneficial for the students who wants to save time and be productive."
        + "\n" + "To know how to use PodnLearn, type Learn"],
    /* 29 */["To access the application, you may have to first register, or login if they have an existing account. Once logged in, you can get ample number of contents and episodes to listen to." + "\n"
        + "If you want to know how to listen to the podcast in PodnLearn, type podcast" + "\n"
        + "If you want to know how to become a podcaster and upload your own podcast on PodnLearn, type upload podcast" + "\n"
        + "If you want to use the LearnAI feature, type learnAI or book reader" + "\n\n"
        + "Thank you."],

    /* 30.1 */["To play and listen to the podcast, simply click on the podcast you wish to listen to, the player window will show up. Click on the ▶ to play the podcast. You can even pause or stop the podcast, by pressing the ⏸ or ⏹, respectively." + "\n"
        + "If you want to favorite any podcast, you can click on the favorite (♥) button. You can find your favorited podcasts in the Favorites section of the website. You can even unfavorite it by clicking it again, it will get removed from your favorites list." + "\n"
        + "Still have a problem or any query, type contact."],
    /* 30.2 */["To upload a podcast on PodnLearn, go to the home page of Podcast section, click on Upload button on the top right corner. Give your podcast a name and a thumbnail which suits your podcast. Then upload your first podcast on the website by providing the name of the episode, episode number, and the episode file which can be of MP4 or WAV format. Click on Upload and your podcast will upload to the public. You can find your uploads on your Profile page." + "\n"
        + "Still have a problem or any query, type contact."],
    /* 30.3 */["To upload your e-book on PodnLearn, click on the 'Switch to LearnAI' button on the top right corner of the home page of PodnLearn. Click on the upload button and give a title for your book. Upload the e-book (which should be in PDF format). Then on the next page, select the pages you want to synthesize it, and select your preferred voice. Click on Publish button to publish it on the website." + "\n"
        + "You can find your e-book on the Home page of the LearnAI section. Click on it to play and listen to it like an audiobook. Your e-book is published privately, so no one can access your e-books that you have uploaded on our website, unless its you." + "\n"
        + "Still have a problem or any query, type contact."],
    /* thankyou */["You're whole-heartedly welcome.", "I'm happy to help. Ask me again if you had any queries later.", "No one ever said that to me. Thank you too! :)"]
]

// Random for any other user input

const alternative = [
    "Same",
    "Go on...",
    "Bro...",
    "Try again",
    "I'm listening...",
    "I don't understand :/"
]

// Whatever else you want :)

const coronavirus = ["Please stay home", "Wear a mask", "Fortunately, I don't have COVID", "These are uncertain times", "Hope it gets all well"]