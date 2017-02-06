# encoding: utf-8
#
# 非表示要素
# @author 在望もむ
# @date 2017/02/06

# Jekyllプラグイン
module Jekyll
  # パンくずリスト出力ブロック
  class HideableBlock < Liquid::Block
    # 初期化フック処理
    # @param  [String]  name  名前
    # @param  [String]  text  テキスト
    # @param  [String]  tokens  トークン
    def initialize(name, text, tokens)
      @option = text.split(' ')
      super
    end

    # ページ毎実施処理
    # @param  [Misc]  context コンテキスト
    def render(context)
      super_output = super
      output = %[<#{@option[0]} class="hidden-block visible-block icon-angle-double-down">#{@option[1]}</#{@option[0]}><div class="hidden-area">#{super_output}</div>]
      output
    end
  end
  # パンくずリスト出力ブロック
  class HiddenBlock < Liquid::Block
    # 初期化フック処理
    # @param  [String]  name  名前
    # @param  [String]  text  テキスト
    # @param  [String]  tokens  トークン
    def initialize(name, text, tokens)
      @option = text.split(' ')
      super
    end

    # ページ毎実施処理
    # @param  [Misc]  context コンテキスト
    def render(context)
      super_output = super
      output = %[<#{@option[0]} class="hidden-block icon-angle-double-down">#{@option[1]}</#{@option[0]}><div class="hidden-area">#{super_output}</div>]
      output
    end
  end
end

Liquid::Template.register_tag('hideable_block', Jekyll::HideableBlock)
Liquid::Template.register_tag('hidden_block', Jekyll::HiddenBlock)
