module CloudfrontHelper
	def include_cloudfront_css(*packages)
		css = include_stylesheets(*packages)
		css = css.gsub("/#{Jammit.package_path}/#{packages}.css","/#{packages}.css") if enabled?
		css
	end

	def include_cloudfront_js(*packages)
		js = include_javascripts(*packages)
		js = js.gsub("/#{Jammit.package_path}/#{packages}.js","/#{packages}.js") if enabled?
		js
	end

	private 
		def enabled?
			CloudfrontAssetHost.enabled && params[:debug_assets].nil?
		end
end
::ActionView::Base.send(:include, CloudfrontHelper)