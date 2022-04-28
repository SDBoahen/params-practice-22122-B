class WoobliesController < ApplicationController


    # GET /wooblies
    def index

        render json: Woobly.all

    end


    # GET /wooblies/:id
    def show

        woobly_to_find = Woobly.find_by( id: params[:id] )
            # woobly_to_find = Woobly.find_by_id( params[:id] )
            # woobly_to_find = Woobly.find_by_name( params[:name] )
        # woobly_to_find = Woobly.find( id: params[:id] )

            some_found_woobly = woobly_to_find

        render json: some_found_woobly

    end


    # POST /wooblies
    def create

        new_woobly = Woobly.create( name: params[:name] )

        render json: new_woobly

    end
    
    
    # PATCH /wooblies/:id
    def update

        woobly_to_find = Woobly.find_by_id( params[:id] )

        woobly_to_find.update( woobly_update_params )
        # woobly_to_find.update( name: params[:name] )
        # woobly_to_find.update( name: "watever_was_in_params" )

            # byebug

            updated_woobly = woobly_to_find

        render json: updated_woobly

    end


    private


    def woobly_update_params
        return params.require( :woobly ).permit( :name )

        # params.permit( :name )
    end


    def woobly_create_params
    end


end


