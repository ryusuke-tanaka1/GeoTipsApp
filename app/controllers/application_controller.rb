class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def set_countries
    @countries = ["アルバニア", "米領サモア", "アンドラ", "南極大陸", "アルゼンチン", "オーストラリア", "オーストリア",
                  "バングラデシュ", "ベラルーシ", "ベルギー", "バミューダ", "ボリビア", "ボツワナ", "ブラジル", "ブルガリア",
                  "カンボジア", "カナダ", "チリ", "中国", "クリスマス島", "ココス（キーリング）諸島", "コロンビア", "コスタリカ",
                  "クロアチア", "キュラソー", "チェコ共和国", "デンマーク", "ドミニカ共和国", "エクアドル", "エジプト", "エストニア",
                  "エスワティニ", "フォークランド諸島", "フェロー諸島", "フィンランド", "フランス", "ドイツ", "ガーナ", "ジブラルタル",
                  "イギリス", "ギリシャ", "グリーンランド", "グアム", "グアテマラ", "香港", "ハンガリー",
                  "アイスランド", "インド", "インドネシア", "イラク", "アイルランド", "マン島", "イスラエル", "イタリア", "日本",
                  "ジャージー", "ヨルダン", "ケニア", "キルギスタン", "ラオス", "ラトビア", "レバノン", "レソト", "リトアニア",
                  "ルクセンブルク", "マカオ", "マダガスカル", "マデイラ", "マレーシア", "マルタ", "マルティニーク", "メキシコ",
                  "ミッドウェー島", "モナコ", "モンゴル", "モンテネグロ", "北マケドニア共和国", "北マリアナ諸島", "ネパール", "オランダ",
                  "ニュージーランド", "ナイジェリア", "ノルウェー", "パキスタン", "パレスチナ", "ペルー", "フィリピン", "ピトケアン諸島",
                  "ポーランド", "ポルトガル", "プエルトリコ", "カタール", "レユニオン島", "ルーマニア", "ロシア", "サンアンドレス", "サンマリノ",
                  "セネガル", "セルビア", "シンガポール", "スロバキア", "スロベニア", "南アフリカ", "韓国", "スペイン", "スリランカ", 
                  "サンピエール島・ミクロン島", "スウェーデン", "スイス", "台湾", "タンザニア", "タイ", "チュニジア", "トルコ", "ウガンダ",
                  "ウクライナ", "アラブ首長国連邦（UAE）", "アメリカ合衆国", "ウルグアイ", "アメリカ領ヴァージン諸島", "バヌアツ", "ベトナム", "その他"]
  end

  private
    def admin_user
      unless current_user.admin?
        flash[:danger] = "権限がありません。"
        redirect_to root_url
      end
    end

    def correct_user
      redirect_to root_url unless current_user?(@user)
    end

    def admin_or_correct_user
      redirect_to root_url if (!current_user?(@user) && !current_user.admin?)
    end
end
