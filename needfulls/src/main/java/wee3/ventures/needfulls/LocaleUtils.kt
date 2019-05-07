/*
 * *
 *  * Created by Prabhu Chandran on 4/6/19 10:32 AM
 *  * Copyright (c) 2019 . All rights reserved.
 *  * Last modified 4/5/19 5:04 PM
 *
 */

package wee3.ventures.needfulls

import android.annotation.TargetApi
import android.content.Context
import android.os.Build
import java.util.*

/**
 * This class is used to change your application locale and persist this change for the next time
 * that your app is going to be used.
 *
 *
 * You can also change the locale of your application on the fly by using the setLocale method.
 *
 *
 * Created by gunhansancar on 07/10/15.
 */
object LocaleUtils {

    const val LANGUAGE = "language"
    fun onAttach(context: Context): Context {
        val lang = getPersistedData(context)
        return setLocale(context, lang)
    }

    fun getLanguage(context: Context): String? {
        return getPersistedData(context)
    }

    fun setLocale(context: Context, language: String?): Context {
        val lang = when ("$language"){
            "Tamil" -> "ta"
            "தமிழ்" -> "ta"
            "English" -> "en"
            "ta" -> "ta"
            "en" -> "en"
            else -> "en"
        }
        persist(context, lang)
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            updateResources(context, lang)
        } else updateResourcesLegacy(context, lang)

    }

    private fun getPersistedData(context: Context): String? {
        return Preference(context).getStringValue(LANGUAGE)
    }

    private fun persist(context: Context, language: String?) {
        Preference(context).setValue(LANGUAGE,(if(language.isNullOrEmpty() || language == "null" || language == "en") "en" else "ta"))
    }

    @TargetApi(Build.VERSION_CODES.N)
    private fun updateResources(context: Context, language: String?): Context {
        val locale = Locale(language!!)
        Locale.setDefault(locale)

        val configuration = context.resources.configuration
        configuration.setLocale(locale)
        configuration.setLayoutDirection(locale)

        return context.createConfigurationContext(configuration)
    }

    @Suppress("DEPRECATION")
    private fun updateResourcesLegacy(context: Context, language: String?): Context {
        val locale = Locale(language!!)
        Locale.setDefault(locale)

        val resources = context.resources

        val configuration = resources.configuration
        configuration.locale = locale
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            configuration.setLayoutDirection(locale)
        }

        resources.updateConfiguration(configuration, resources.displayMetrics)

        return context
    }
}