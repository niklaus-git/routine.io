module ApplicationHelper
  def title(blog_title)
    content_for(:title) { blog_title }
  end

  def inline_svg(filename, options={})
    file = File.read(Rails.root.join('app', 'assets', 'images', 'svg', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg["class"] = options[:class]
    end
    doc.to_html.html_safe
  end

  def avatar_url(user)
    if user.picture.present?
      url = user.picture
    elsif gravatar?(user)
      gravatar = Digest::MD5::hexdigest(user.email).downcase
      url = "http://gravatar.com/avatar/#{gravatar}.png"
    else
      url = "default.png"
    end
  end

  def gravatar?(user)
    gravatar = Digest::MD5::hexdigest(user.email).downcase
    gravatar_check = "http://gravatar.com/avatar/#{gravatar}.png?d=404"
    uri = URI.parse(gravatar_check)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response.code.to_i != 404
  end
end
