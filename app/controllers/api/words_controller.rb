class Api::WordsController < ApplicationController
    before_action :find_word, only: [:show, :update, :destroy]

    def index
        @words = Word.all

        render json: @words.as_json(include: {definitions: { only: [:id, :definition, :partOfSpeech]}})
    end

    def show
        render json: @word.as_json(include: {definitions: { only: [:id, :definition, :partOfSpeech]}})
    end

    def create
        @word = Word.new(word_params)
        if @word.save
            render json: @word
        else
            render error: { error: 'Unable to create Word.' }, status: 400
        end
    end

    def update
        if @word
            @word.update(word_params)
            render json: { message: 'Word successfully updated.' }, status: 200
        else
            render json: { error: 'Unable to update Word.'}, status: 400
        end
    end

    def destroy
        if @word
            @word.destroy
            render json: { message: 'Word successfully deleted.' }, status: 200
        else
            render json: { error: 'Unable to delete Word.' }, status: 400
        end
    end

    private

    def word_params
        params.permit(:word)
    end

    def find_word
        @word = Word.includes(:definitions).find(params[:id])
    end
end
