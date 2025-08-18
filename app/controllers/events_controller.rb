class EventsController < ApplicationController
  def index
    @events = ["BugSmash", "Hackathon", "Katacamp", "Rails User Group"];
  end
end
