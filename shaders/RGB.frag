#pragma header
		uniform vec3 colorOld;
		uniform vec3 colorNew;
		uniform bool shaderIsActive;

		/**
		 * Helper method that normalizes an RGB value (in the 0-255 range) to a value between 0-1.
		 */
		vec3 normalizeColor(vec3 color)
		{
			return vec3(
				color[0] / 255.0,
				color[1] / 255.0,
				color[2] / 255.0
			);
		}

		void main()
		{
			vec4 pixel = texture2D(bitmap, openfl_TextureCoordv);

			if (!shaderIsActive)
			{
				gl_FragColor = pixel;
				return;
			}

			/**
			 * Used to create some leeway when comparing the colors.
			 * Smaller values = smaller leeway.
			 */
			vec3 eps = vec3(0.009, 0.009, 0.009);

			vec3 colorOldNormalized = normalizeColor(colorOld);
			vec3 colorNewNormalized = normalizeColor(colorNew);

			if (all(greaterThanEqual(pixel, vec4(colorOldNormalized - eps, 1.0)) ) &&
				all(lessThanEqual(pixel, vec4(colorOldNormalized + eps, 1.0)) )
			)
			{
				pixel = vec4(colorNewNormalized, 1.0);
			}

			gl_FragColor = pixel;
		}