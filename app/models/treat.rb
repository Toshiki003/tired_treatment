class Treat < ApplicationRecord
  before_validation :set_nameless_user
  before_save :set_treat

  validates :user, presence: true, length: {maximum: 30}
  validates :event, presence: true, length: {maximum: 30}
  validates :tired_level, presence:true, inclusion: { in: 1..3 }
  validates :reward_category, presence: true, length: {maximum: 30}

  private
  def set_nameless_user
    #セッターメソッドを呼ぶときにはselfを省略できない、らしい。うーん。
    self.user = "名無し" if user.blank?
  end

  def set_treat
      treat_results = {
        "ごちそう" => {
            1 => [
                "コンビニで好きなスイーツを購入",
                "コンビニで好きなお菓子を購入",
                "コンビニで好きなアイスを購入",
                "パン屋さんで素敵なパンを購入",
                "スタバでフラペチーノを堪能",
                "スーパーで贅沢にお刺身を購入",
                "スーパーで特売のステーキを購入",
              ],
              2 => [
                "近所のケーキ屋さんで好きなケーキ購入",
                "吉野家でうな丼に舌鼓",
                "松屋でごろごろチキンカレーを満喫",
                "Uber Eatrsでお好きな料理をオーダー",
                "お寿司屋さんで贅沢ランチ",
                "お蕎麦屋さんで贅沢ランチ",
                "いきなりステーキでお肉を満喫",
                "インドカレー屋で刺激的なランチを堪能",
                "宅配ピザでピザパーティー",
                "近所の美味しいラーメンを満喫",
                "近所のカフェで身も心もリフレッシュ",
                "デパ地下で惣菜を好きなだけ購入"
              ],
              3 => [
                "Uber Eatrsで好きなものを頼み放題",
                "お寿司屋さんで贅沢ディナー",
                "お蕎麦屋さんで贅沢ディナー",
                "家族と焼き肉屋さんで贅沢ディナー",
                "食べログ百名店で舌鼓",
                "ポケットコンシェルジュで素敵なお店を予約",
                "大切な人とイタリアンでコース料理を堪能",
              ]
            },
            "ショッピング" => {
              1 => [
                "100円ショップで爆買",
                "3coinsで爆買",
                "ファストファッションでショッピング",
                "ドン・キホーテでショッピング",
                "本屋さんで気になる本を購入",
                "Amazonでショッピング(2000円以下)",
                "雑貨屋さんで気ままにショッピング"
              ],
              2 => [
                "無印良品で素敵なショッピング",
                "ikeaで気ままにショッピング",
                "ニトリで楽しくショッピング",
                "セレクトショップでオシャレにショッピング",
                "家電量販店で楽しくショッピング",
                "Amazonでショッピング(1万円以下)",
                "@cosmeで気になるコスメをショッピング",
                "アンテナショップで気ままにショッピング",
                "LUMINEでお得にショッピング",
                "PARCOで楽しくショッピング",
                "東急ハンズで心踊らすショッピング"
              ],
              3 => [
                "Amazonで注文確定し放題",
                "LOUIS VUITTONでエレガントにショッピング",
                "IPSAで心ときめくショッピング",
                "大塚家具で豪華にショッピング",
                "伊勢丹でお上品にお買い物",
                "本屋で漫画全巻大人買い"
              ]
            },
            "エンタメ" => {
              1 => [
                "YouTubeで癒やしのネコ動画を視聴",
                "好きなアーティストの曲を満喫",
                "Netflixで好きなドラマを視聴",
                "radikoで深夜ラジオのアーカイブを視聴",
                "録画していたバレエティ番組を視聴",
                "気になっていたスマホゲームをダウンロード"
               ],
              2 => [
                "Youtubeで好きなだけ見放題",
                "Netflixで好きなドラマを1シーズン視聴",
                "Netflixで好きなアニメを全話一気観",
                "映画館で映画を堪能",
                "カラオケでストレス発散",
                "ボーリングでエキサイティング",
                "好きなゲームを1時間プレイ"
              ],
              3 => [
                "好きなアーティストのライブに参戦",
                "好きなアイドルのイベントに参戦",
                "音楽フェスを堪能",
                "好きなお笑い芸人の単独ライブで爆笑",
                "好きなサッカーチームの試合を観戦",
                "好きな野球チームの試合を観戦",
                "好きなゲームを気が済むまでプレイ",
                "ボードゲームカフェで1日満喫"
              ]
            }
          }
          #nameカラムにはこの戻り値が入る。だからDBカラムにあってもビューでユーザーからの入力値にreward_nameは必要ない
          self.reward_name = treat_results.dig(reward_category, tired_level).sample
  end
end
