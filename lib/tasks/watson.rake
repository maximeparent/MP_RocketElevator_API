namespace :watson do
    task create: :environment do
        # frozen_string_literal: true
        require "json"
        require "ibm_watson/authenticators"
        require "ibm_watson/text_to_speech_v1"
        
        authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
            apikey: ENV["WATSON_API_KEY"]
        )
        text_to_speech = IBMWatson::TextToSpeechV1.new(
            authenticator: authenticator
        )
        text_to_speech.service_url = ENV["WATSON_URL"]

        File.open("hello_world.wav", "wb") do |audio_file|
            response = text_to_speech.synthesize(
              text: "Hello world",
              accept: "audio/wav",
              voice: "en-US_AllisonVoice"
            )
            audio_file.write(response.result)
            puts "========================================================================================================="
        end

        puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    end
end