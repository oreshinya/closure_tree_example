class WelcomeController < ApplicationController

  def index
    @folders = Folder.roots
  end
end
