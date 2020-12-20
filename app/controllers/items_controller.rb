class ItemsController < ApplicationController

def new
end

def create
end
  
end

private

def item_parames
  prams.require(:item).permit(:content, :image)
end