module CloudfrontHelper
	def include_cloudfront_css(*packages)
		css = include_stylesheets(*packages)
		css = css.gsub("/#{Jammit.package_path}/#{packages}.css","/#{packages}.css") if CloudfrontAssetHost.enabled
		css
	end

	def include_cloudfront_js(*packages)
		js = include_javascripts
		js = js.gsub("/#{Jammit.package_path}/#{packages}.js","/#{packages}.js") if CloudfrontAssetHost.enabled
		js
	end
end
::ActionView::Base.send(:include, CloudfrontHelper)