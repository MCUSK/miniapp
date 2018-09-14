class CardsController < ApplicationController


def index #一覧
  @cards= Card.order("id DESC")
end

def new #新規投稿
  @cards = Card.new
end

def create #投稿送信
  Card.create(title:create_params[:title],text:create_params[:text], user_id:current_user.id)
end

def show
  @card = Card.find(params[:id])
end

def edit #編集
  @card = Card.find(params[:id])
end

def update #更新
  card = Card.find(params[:id])
  if card.user_id == current_user.id
    card.update(create_params)
end

def destroy #削除
  card = Card.find(params[:id])
  if card.user_id == current_user.id
    card.destroy
  end
end


end


private
def create_params
  params.require(:card).permit(:title, :text,)
end

end
