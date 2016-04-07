module Controller
  class Owner < ::BaseServer
    get "/owners" do
      @owners = ::Owner.all
      erb :'owners/index'
    end

    get "/owners/new" do
      erb :'owners/new'
    end

    post "/owners" do
      payload = params["owner"]
      ::Owner.create(payload)
      redirect to("/owners")
    end

    delete "/owners/:id" do
      @owner = ::Owner.find(params["id"])

      @owner.destroy
      redirect to("/owners")
    end
  end
end
