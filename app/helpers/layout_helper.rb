module LayoutHelper

  ##
  # Get namespace accoring to current controller path.
  #
  def namespace
    controller_path.split('/').first
  end

  ##
  # Render Page Title
  #
  # It shows an apple if it's in development env.
  #
  def page_title(title)
    base_title = 'Toolbox'
    title = base_title if title.empty?
    title = (Rails.env.development?) ? " #{title}" : title
    title.html_safe
  end

  def body_class
    lang_tag = I18n.locale.to_s
    body_class = [lang_tag]
    prefix = ''
    segments = controller_path.split('/')
    segments.each_with_index do |segment, i|
      class_name = prefix + segment
      body_class.push(class_name)
      prefix = prefix + segment + '-'
    end
    body_class.push(prefix + action_name)
    body_class = body_class.join(' ')
  end

end
