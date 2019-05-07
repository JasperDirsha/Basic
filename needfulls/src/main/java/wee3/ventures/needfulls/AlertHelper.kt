/*
 * *
 *  * Created by Prabhu Chandran on 4/6/19 12:14 PM
 *  * Copyright (c) 2019 . All rights reserved.
 *  * Last modified 4/6/19 12:14 PM
 *
 */

package wee3.ventures.needfulls

import android.app.Activity
import android.view.View
import androidx.annotation.Nullable
import com.tapadoo.alerter.Alerter

class AlertHelper ( private val mActivity : Activity ) {
    fun showLoading(title  : Any, message : Any){
        Alerter.create(mActivity)
                .setEnterAnimation(R.anim.alerter_slide_in_from_top)
                .enableInfiniteDuration(true)
                .setIcon(R.drawable.smartphone)
                .showIcon(true)
                .setTitle("$title")
                .setText("$message")
                .setDismissable(false)
                .enableProgress(true)
                .disableOutsideTouch()
                .setBackgroundResource(R.color.indigo_900)
                .show()
    }

    fun showLoading(title  : Any, message : Any, @Nullable icon : Int = R.drawable.warning, @Nullable iconColor : Int = R.color.white, @Nullable backColor : Int = R.color.indigo_900, @Nullable progess : Boolean = false, @Nullable iconpulse : Boolean = false, @Nullable press_dismiss : Boolean = false, @Nullable swipe_dismiss : Boolean = false, @Nullable inifinite : Boolean = true, @Nullable duration : Long = 1000L /** Milliseconds **/){
        val alert = Alerter.create(mActivity)
        when {
            press_dismiss ->{ alert.setOnClickListener(View.OnClickListener { hideLoading() }) }
            progess ->{ alert.enableProgress(progess) }
            iconpulse ->{ alert.enableIconPulse(iconpulse) }
            swipe_dismiss ->{ alert.enableSwipeToDismiss() }
            inifinite ->{ alert.enableInfiniteDuration(inifinite).disableOutsideTouch().setDismissable(false) }
            inifinite.not() ->{ alert.enableInfiniteDuration(inifinite).setDismissable(true).setDuration(duration) }
        }

        alert.setTitle("$title")
        alert.setText("$message")
        alert.setIcon(icon)
        alert.showIcon(true)
        alert.enableInfiniteDuration(true)
        alert.setBackgroundColorRes(backColor)
        alert.show()
    }

    fun hideLoading(){
        if (Alerter.isShowing){
            Alerter.hide()
        }
    }

    fun destroy() {
        Alerter.clearCurrent(mActivity)
    }
}