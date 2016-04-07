module Controller
  class Homepage < ::BaseServer
    get "/" do
      erb :homepage
    end
  end
end
