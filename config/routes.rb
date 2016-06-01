Rails.application.routes.draw do
        post '/phones' =>  'words#phones'
        post '/sentences/avg_len' =>  'words#avg_sent_len'
        post '/words/avg_len' =>  'words#avg_word_len'
        post '/words/most_com' =>  'words#most_com'
        post '/words/median' =>  'words#median'
end
