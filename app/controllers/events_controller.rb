class EventsController < ApplicationController
    before_action :set_event, :only => [:show, :edit , :update, :destroy]
    #程式執行action之前會先呼叫set_event方法,並指定
    def index
        #@events = Event.all  (修改前)
        @events = Event.page(params[:page]).per(10)
        #安裝完kaminari分頁外掛,用分頁方式
        #撈出所有資料以每頁10筆
    end

    def show
        @page_title = @event. name
        #撈到文章的name 給一個變數
    end

    def new
        @event = Event.new
        #初始化一個資料庫還沒儲存
    end

    def create
        @event = Event.new(event_params)

        if @event.save #save 有回傳值true和false
        #成功存起來

           flash[:notice] = "新增成功"
            #成功可以顯示訊息,需要先在layouts設定
            redirect_to :action => :index
        #轉到 index 頁面,可以省略:action
        else
            render :action => :new 
            #失敗的話這裡是顯示new.html.erb,所以不是真的執行action
           # 可以省略:action
        end
    end

    def edit

    end

    def update
        if @event.update(event_params)

            flash[:notice] = "編輯成功"

            redirect_to :action => :show, :id => @event
        #轉向頁面到show action ,為何加入:id => @event 有待驗證
        else
            render :action => :edit
        end
    end

    def destroy
        @event.destroy
        #刪除
        flash[:alert] = "刪除成功"
        
        redirect_to :action => :index
    end


    private

    def set_event
        @event = Event.find(params[:id])
        #根據每篇文章ID從event資料庫找出資料來
    end

    def event_params
        params.require(:event).permit(:name, :description)
         #針對event 只允許存取 name 和description
    end

end
