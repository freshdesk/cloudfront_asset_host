module CloudfrontHelper
	def include_cloudfront_css(*packages)
		options = packages.extract_options!
		css = include_stylesheets(packages[0], options)
		css = css.gsub("/#{Jammit.package_path}/#{packages}.css","/#{packages}.css") if enabled?
		css
	end

	def include_cloudfront_js(*packages)
		options = packages.extract_options!
		js = include_javascripts(packages[0], options)
		js = js.gsub("/#{Jammit.package_path}/#{packages}.js","/#{packages}.js") if enabled?
		js
	end

	private 
		def enabled?
			CloudfrontAssetHost.enabled && params[:debug_assets].nil?
		end
end
::ActionView::Base.send(:include, CloudfrontHelper)