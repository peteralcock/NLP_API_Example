
      class WordsController < ApplicationController
        respond_to :json

        def avg_word_len
          if params[:text]
            counter = WordsCounted.count(params[:text])
            result = counter.average_chars_per_token
            render json: result
          else
            render status: :unprocessable_entity
          end
        end


        def most_com
          if params[:text]
            counter = WordsCounted.count(params[:text])
            result = counter.token_frequency.first
            render json: result
          else
            render status: :unprocessable_entity
          end
        end


        def median
          if params[:text]
            counter = WordsCounted.count(params[:text])
            ary = counter.token_frequency
            mid = (ary.length / ary.count).abs
            result = ary[mid]
            render json: result
          else
            render status: :unprocessable_entity
          end
        end


        def avg_sent_len
          if params[:text]
            sentences = params[:text].gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
            sentences_sorted = sentences.sort_by { |sent| sent.length }
            middle = (sentences_sorted.count.to_f / 2).abs
            render json: sentences_sorted[middle].length
          else
            render status: :unprocessable_entity
          end
        end

        def phones
          if params[:text]
            result = []
            params[:text].scan(/\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/).each do |number|
              if number
                phone_number = number.join.scan(/\d/).join('')
                result << phone_number
              end
            end
            render json: result
          else
            render status: :unprocessable_entity
          end
        end


      end
