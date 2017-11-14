# Wyncode Pitch Day Cheatsheet

## Logistics
- Hold the microphone uncomfortably close to your face. Almost put it inside your mouth. Louder is always better.
  - The back of the room sometimes gets noisy. Speak up so they can hear you.
- Don't stand or walk in front of the projector screen. Don't hand off the mic across the stage
- Try to avoid turning to look at the screen
  - It pulls your mouth away from the mic and lowers your volume
  - You're turning away from the audience
- Waffle Wednesday (LiveNinja)
  - You will share one mic and all stand on the same side of the screen.
- Pitch Day (Miami)
  - 2 microphones. Split into two groups, one situated on each side of the screen. Each group has one mic. The screen is too wide to cross quickly, so each group on each side of the screen shares one mic.
- Practice smoothly passing the mic between team members.
- When you transition from one speaker to the next, use a segue. 
  - Just say their name.
  - "And now John will speak about the technology we used to build this app"
    - "Thank you James"
  - "Isn't that right Jane?"
    - "Yes, it's great. In fact..."
    - "Exactly Nick."
  - "Hey Julia. What would you do to solve this problem?"
    - "Well, before this app came along, I used to..."
  - "Chris will now walk us through a demo of the app."
    - "Thanks Alex."

## Pitch Format

### Intro (1min - 1min30sec)
- Intro the team and project's title
  - Create a "high concept pitch" / tagline
- Start with a a story
  - Start with a question ("Who wants to be a millionaire?", "Who has trouble finding deals for Boeing airplane parts?")
  - Tell a personal story or invent a fictional character (with a fake name)
- How did you come up with the app name?
- Introduce a problem
  - Make sure your app actually solves the problem you present
- Inherency: talk about how the current solutions to these problems are bad
  - Too difficult to use
  - Too expensive
  - Be expressive: use comedy or be passionate about how annoying and painful the current solutions are

### Video Demo (2min - 2min30sec)
- Break up long videos into multiple short videos
  - Makes the app seem like it has more features.
  - Helps with pacing (because you may not speak at the same speed on Pitch Day night as you did in practice, so the pauses between videos gives you a chance to speed up/slow down).
  - One video per "feature"
    - Title slide: describes the problem
    - Video demo a solution to the described problem
  - One video per "user type".
    - "As a buyer" => show buyer demo. "As a seller" => show seller demo.
      - Help the audience keep track of who is doing what in the app.
    - Use "As a ?" as your title card to separate the video demos from each other.
      - Give your user roles real names (e.g. "John the Baker", "Jack the Car Salesman")
- Fast-forward videos of filling out forms.
- Talk about your design
  - Demo and talk about hover effects and animations.
  - Use positive adjectives to describe the design _during_ the demo: amazing, intuitive, colorful, thoughtful, delightful
- Talk about your tech _while_ you're showing it
  - e.g. This data comes from an API.
  - e.g. This updates in realtime thanks to ActionCable.
  - You won't have to spend as much time later explaining how your tech was applied to the app.
- Presenting video slides
  - 1-click to land on the slide
  - 1-click to play the video
  - 1-click to skip to next slide. 
  - There is no (easy) ffwd or rwd feature. If you skip a video, you have to start from the beginning
    - Another reason why lots of small vids is better than one long one. If you mess up, you don't have to start from the very beginning.
    
### Show off the tech you used (30sec - 1min)
- Collage of tech logos
  - Use the correct terms
    - JavaScript, not Javascript
    - jQuery, not Jquery
    - HTML/CSS, not html/css or Html/Css
    - "Ruby" and "Rails" (or just "Ruby on Rails"), not "Ruby and Ruby on Rails"
    - Ruby, not ruby
    - AJAX, not ajax
- If there's a lot, you may organize your tech
  - By feature
  - By type: front-end/back-end/apis
- Talk about testing.
- Talk about agile project management or lean startup customer validation.

### Future Plans (10sec - 20sec)
- Things you would have done if you had more time (very common judge question).

### Final Slide
- Just your names, photos, & contact info
  - Project name is optional and shouldn't be the emphasis
  - This is about you
- This slide will be up for the longest. It will be displayed during the judge's Q&A. Take advantage of that linger time.
- You may take new team photo selfie if your headshots aren't good.
  - Smile. Pretend like you got along well with each other while working on this project.

### Closing Outro (10sec - 30sec)
- What do you want to do after Wyncode?
- After this event, what kind of things do you want people to approach you to talk about?
- Is this a startup you plan to continue working on? This will be the default assumption of a "Pitch Day".
  - Are you looking for investors? Strategic partners? Talent?
- Do you want a job?
  - Tell your story arc
    - 2 months ago I was X. 
    - Now I'm looking for a job in (full-stack / front-end / back-end) 
      - in (Miami / Ft. Lauderdale / South Florida / Nationwide) 
      - in (fintech / medtech / advertising & marketing). 
  - Your background is important. Startups like coders who sit at the intersection of two fields (medtech, fintech, adtech, musictech, etc.)
- If there isn't a natural ending, just end by saying "Thank you."

# Slide Formatting
- Use more slides
  - Don't spend a lot of time talking in front of one slide
- Use pictures over words
- Don't be wordy
  - Don't write long sentences that stretch across the slide and wrap into a new line
  - Don't put too many words on a slide.
- Text style
  - Large fonts: easily visible from the back row
  - Sharp color contrasts 
    - between slide font and background color
    - in your demo videos (and in your app)
    - The colors on your laptop and in the class *will not match* the colors on the projector we use on Pitch Day.
  - Someone in the back of the room should be able read your slides
- Use bulleted lists
  - You may use custom bullet-point graphics

# Judge's Questions 
- Don't walk away when you're done. Stay on stage for judge's questions.
- What was your biggest technical challenge and how did you overcome it?
- Project Management
  - How did you project manage? How did you organize and prioritize the work? What project management tools did you use?
  - What would you have done if you had more time? Which items didn't make it off the backlog?
  - How did you split up the work?
  - Were there disagreements among the team members? How did you resolve them?
  - How did you transition from idea to code?
  - What did you think was going to be hard (high estimate), but turned out to be easy? (or vice versa)
- Tell me an example of how you used [some tech listed in your presentation].
  - Don't list tech that you can't talk about (HTML5 vs HTML, CSS3 vs CSS) 
- Data
  - How did you get your initial data set? Seed file? API? Web scraping?
  - Was that easy or hard? How did you do it?
  - How did you store it? What did you keep and what did you throw away?
- Infrastructure
  - Did you deploy the app or is it only running on localhost?
  - How did you deploy it?
  - How many servers/dynos/droplets/instances did you need to use?
    - Heroku dynos (probably 1) + databases (also probably 1) + add-ons (e.g. Redis)
- Did you consider adding (random feature) to this app? 
  - If you did, then talk about why you did/didn't build it
  - If it's something totally out of left field, then say "No, but thank you for the suggestion. We'll consider adding it later."
- Did you talk to (random person or organization) before building your app?
  - If you did, what happened when you spoke to that person/organization?
  - If you didn't, then say "We'll chat with you later to setup a meeting with that person/organization."
- Testing
  - What did you test? 
  - How many tests did you write? 
  - What kinds of tests did you write? 
  - What testing gems did you use?
  - What's your testing suite's code coverage? (What percentage of your total feature set is tested? What percentage of all your lines of code are tested?)
- Design
  - What inspired your design? 
  - How did you decide on the design as a group?
- Gems
  - Did you use a gem to implement that feature or do it by hand? Why or why not?
  - Have you heard of the ? gem?
    - If you have, why didn't you use it? Did you have trouble with it?
    - If you haven't, just say you'll consider using it in the future.
- Product Management
  - Did you pivot your app idea at any point? How and why?
  - Did you test or validate your app with real users (besides yourselves)?
- Prompting Questions
  - Judges are lazy and don't like coming up with questions, so you can prompt them with questions you're ready to answer.
  - e.g. I don't have time to talk about X, but I'd be happy to answer questions about it later.

# Appeal To Two Audiences
- Technical audience: impress the technical hiring partners with your mastery of technical jargon
- Non-technical audience: explain your technical jargon so HR and business clients feel they can trust you with their projects
- Pander to the judges and any important people in the audience
    - e.g. If someone from Facebook is on the panel, then your "Future Plans" should include Facebook integration.
    - e.g. If someone from MagicLeap is on the panel, then your "Future Plans" should include Augmented/Mixed Reality.
