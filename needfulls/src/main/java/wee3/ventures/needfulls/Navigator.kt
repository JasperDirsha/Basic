package wee3.ventures.needfulls

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Bundle


object Navigator{
    inline fun <reified T : Activity> launch(context: Context): Boolean {
        val intent = Intent(context, T::class.java)
        context.startActivity(intent)
        return true
    }

    inline fun <reified T : Activity> launch(context: Context, bundlekey : String, bundle: Bundle): Boolean {
        val intent = Intent(context, T::class.java)
            .putExtra(bundlekey,bundle)
        context.startActivity(intent)
        return true
    }

    fun exit(context: Context){
        val intent = Intent(Intent.ACTION_MAIN)
        intent.addCategory(Intent.CATEGORY_HOME)
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        context.startActivity(intent)
    }
}