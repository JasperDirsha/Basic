/*
 * *
 *  * Created by Prabhu Chandran on 3/15/19 11:24 AM
 *  * Copyright (c) 2019 . All rights reserved.
 *  * Last modified 3/15/19 11:24 AM
 *
 */

package wee3.ventures.needfulls

import android.annotation.SuppressLint
import android.content.Context
import android.content.SharedPreferences

@SuppressLint("CommitPrefEdits")
class Preference(mcontext : Context) {
    private var sharedPreferences : SharedPreferences? = null
    private var editor : SharedPreferences.Editor? = null
    init {
        sharedPreferences = mcontext.getSharedPreferences(BuildConfig.APPLICATION_ID, Context.MODE_PRIVATE)
        editor = sharedPreferences!!.edit()
    }
    fun setValue(key : String,value : String){
        editor!!.putString(key,value).commit()
    }

    fun setValue(key : String,value : Boolean){
        editor!!.putBoolean(key,value).commit()
    }

    fun setValue(key : String,value : Float){
        editor!!.putFloat(key,value).commit()
    }

    fun setValue(key : String,value : Int){
        editor!!.putInt(key,value).commit()
    }

    @Suppress("NULLABILITY_MISMATCH_BASED_ON_JAVA_ANNOTATIONS")
    fun getStringValue(key: String) : String{
        return sharedPreferences!!.getString(key,"")
    }

    @Suppress("NULLABILITY_MISMATCH_BASED_ON_JAVA_ANNOTATIONS")
    fun getBooleanValue(key: String) : Boolean{
        return sharedPreferences!!.getBoolean(key,false)
    }

    @Suppress("NULLABILITY_MISMATCH_BASED_ON_JAVA_ANNOTATIONS")
    fun getIntValue(key: String) : Int{
        return sharedPreferences!!.getInt(key,0)
    }

    @Suppress("NULLABILITY_MISMATCH_BASED_ON_JAVA_ANNOTATIONS")
    fun getFloatValue(key: String) : Float{
        return sharedPreferences!!.getFloat(key,0f)
    }

    fun clear(){
        editor!!.clear().commit()
    }
}