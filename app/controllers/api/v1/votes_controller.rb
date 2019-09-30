class Api::V1::VotesController < ApplicationController
    before_action :find_vote, only: [:show, :update]
    def index
        @votes = Vote.all
        render json: @votes
    end

    def show
        render json: @vote
    end

    def create 
        byebug
    end

    def update
        @vote.update(vote_params)
        render json: @vote
    end
    
    private
    
    def find_vote
        @vote = Vote.find(params[:id])
    end

    def vote_params
        params.permit(:upvote)
    end
end