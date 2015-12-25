class SunamiAttendeesController < ApplicationController

before_action :find_sunami

def index
  @attendees = @sunami.attendees
end

def show
  @attendee = @sunami.attendees.find( params[:id] )
end

def new
  @attendee = @sunami.attendees.build
end

def create
  @attendee = @sunami.attendees.build( attendee_params )
  if @attendee.save
    redirect_to sunami_attendees_url( @sunami )
  else
    render :action => :new
  end
end

def edit
  @attendee = @sunami.attendees.find( params[:id] )
end

def update
  @attendee = @sunami.attendees.find( params[:id] )

  if @attendee.update( attendee_params )
    redirect_to sunami_attendees_url( @sunami )
  else
    render :action => :edit
  end

end

def destroy
  @attendee = @sunami.attendees.find( params[:id] )
  @attendee.destroy

  redirect_to sunami_attendees_url( @sunami )
end

protected

def find_sunami
  @sunami = sunami.find( params[:sunami_id] )
end

def attendee_params
  params.require(:attendee).permit(:name)
end

end
