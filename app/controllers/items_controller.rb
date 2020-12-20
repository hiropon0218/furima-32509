class ItemsController < ApplicationController

  def index
  end
  
end

privete

def item_parames
  prams.require(:item).permit(:content, :image)
end