module CodeRayTags
  include Radiant::Taggable

  desc %{
    Outputs formatted source code, enclosed in &lt;code&gt; tags. Use parameter language to specify the language the source code is in.
    Supported languages are:
    <ul>
      <li>c</li>
      <li>css</li>
      <li>delphi</li>
      <li>diff</li>
      <li>html</li>
      <li>java</li>
      <li>java_script</li>
      <li>json</li>
      <li>plaintext</li>
      <li>rhtml</li>
      <li>ruby</li>
      <li>scheme</li>
      <li>sql</li>
      <li>xhtml</li>
      <li>xml</li>
      <li>yaml</li>
    </ul>
    *Usage:* 
    <pre><code><r:code language="html" [line_numbers="true"]>...source code goes here...</r:code></code></pre>
  }
  tag 'code' do |tag|
    lang = tag.attributes['language'] || 'plaintext'
    line_numbers = tag.attributes.key?('line_numbers') ? :inline : nil
    return CodeRay.scan(tag.expand.to_s.strip, lang.to_sym).html(:wrap => :div, :line_numbers => line_numbers )
  end
end
