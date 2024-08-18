module ApplicationHelper
  def google_analytics_tag
    google_analytics_id = ENV['GOOGLE_ANALYTICS_ID']

    tag.script(async: true, src: "https://www.googletagmanager.com/gtag/js?id=#{google_analytics_id}") +
      tag.script do
        <<-JS.html_safe
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '#{google_analytics_id}');
        JS
      end
  end
end
