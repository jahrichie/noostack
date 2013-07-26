class WelcomeController < ApplicationController
  def index
  end
  def hotness
    @stack = Stack.order("created_at DESC") 
  end
end
