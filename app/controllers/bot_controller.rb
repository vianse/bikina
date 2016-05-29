class BotController < ApplicationController
 def webhook
   if params['hub.verify_token'] == "EAAWmSTe58XEBAKPYvuI8xqEiVxAPU7LuplSC6Q9qc4HW0T7cKSMAZC4XsmnEiGJpMv8ghqSHTqcLTzIUIhtKzPACUdUkkffEslu7aXqmiXfL760N3LR48fj507kWmFTBj1ZAi3QYeeJYknsuo7ZAA5Tvw3ZBFZCwJcfaLFDL0VQZDZD"
     render text: params['hub.challenge'] and return
   else
     render text: 'error' and return
   end
  end
end