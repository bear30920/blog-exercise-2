class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
        #根據每篇文章ID從event資料庫找出資料來
    end

    def new
        @event = Event.new
        #初始化一個資料庫還沒儲存
    end

    def create
        @event = Event.new(event_params)

        @event.save
        #存起來
        redirect_to :action => :index
        #轉到 index 頁面
    end

    def edit
        @event = Event.find(params[:id])
        #根據每篇文章ID從event資料庫找出資料來
    end

    def update
        @event = Event.find(params[:id])
        @event.update(event_params)
        redirect_to :action => :show, :id => @event
        #轉向頁面到show action ,為何加入:id => @event 有待驗證
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        #刪除
        redirect_to :action => :index
    end


    private

    def event_params
        params.require(:event).permit(:name, :description)
         #針對event 只允許存取 name 和description
    end

end
