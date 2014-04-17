Pod::Spec.new do |s|
  s.name             = "USStatePicker"
  s.version          = "0.1.0"
  s.summary          = "Drop in UIPickerView that allows for US State selection."
  s.description      = <<-DESC
                        Drop in UIPickerView that shows all the states in the US and allows
                        for selection.
                       DESC
  s.homepage         = "http://github.com/fmscode"
  s.license          = 'MIT'
  s.author           = { "Frank Michael Sanchez" => "orion1701@me.com" }
  s.source           = { :git => "http://EXAMPLE/NAME.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Assets/*.plist'

end
