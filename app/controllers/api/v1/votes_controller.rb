class Api::V1::VotesController < ApplicationController
    before_action :find_vote, only: [:show, :update, :destroy]
    def index
        @votes = Vote.all
        render json: @votes
    end

    def show
        render json: @vote
    end

    def create 
        @vote = Vote.create(params.permit(:upvote, :playlist_id, :user_id))
        render json: @vote
    end

    def update
        @vote.update(params.permit(:upvote))
        render json: @vote
    end

    def destroy 
        @vote.destroy
        render json: {message: "This vote has been destroyed"}
    end
    
    private
    
    def find_vote
        @vote = Vote.find(params[:id])
    end
end