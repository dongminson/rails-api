class Api::DefinitionsController < ApplicationController
    before_action :find_definition, only: [:show, :update, :destroy]

    def index
        @definitions = Definition.all
        render json: @definitions
    end

    def show
        render json: @definition
    end

    def create
        @definition = Definition.new(definition_params)
        if @definition.save
            render json: @definition
        else
            render error: { error: 'Unable to create definition.' }, status: 400
        end
    end

    def update
        if @definition
            @definition.update(definition_params)
            render json: { message: 'Definition successfully updated.' }, status: 200
        else
            render json: { error: 'Unable to update definition.' }, status: 400
        end
    end

    def destroy
        if @definition
            @definition.destroy
            render json: { message: 'Definition successfully deleted.' }, status: 200
        else
            render json: { error: 'Unable to delete definition.'}, status: 400
        end
    end

    private

    def definition_params
        params.permit(:partOfSpeech, :definition, :word_id)
    end

    def find_definition
        @definition = Definition.find(params[:id])
    end

end
