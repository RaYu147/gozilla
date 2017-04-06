class Staff::TopController < Staff::Base
# アクセス制御をスキップする
  skip_before_action :authorize

  def index
     render action: 'index'
  end
end
