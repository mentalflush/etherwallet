<!-- Send Transaction Page -->
<article class="tab-pane active" ng-if="globalService.currentTab==globalService.tabs.signMsg.id" ng-controller='signMsgCtrl'>

  <h2>
    <a translate="NAV_SignMsg" ng-class="{'isActive': visibility=='signView'}" ng-click="visibility='signView'"> Sign Message </a>
    or
    <a translate="MSG_verify"  ng-class="{'isActive': visibility=='verifyView'}" ng-click="visibility='verifyView'"> Verify Message </a> </h2>

  <section class="row" ng-switch="visibility">


<!-- Sign Message Stuff -->
    <div class="col-xs-12" ng-switch-when="signView">

      <div class="alert alert-info" >
        <ul>
          <li translate="MSG_info1">Include the current date so the signature cannot be reused on a different date.</li>
          <li translate="MSG_info2">Include your nickname and where you use the nickname so someone else cannot use it.</li>
          <li translate="MSG_info3">Inlude a specific reason for the message so it cannot be reused for a different purpose.</li>
        </ul>
      </div>
      <!-- Message -->
      <div class="form-group">
        <h4 translate="MSG_message"> Message </h4>
        <textarea class="form-control" ng-model="signMsg.message" placeholder="This is user kvhnuke on reddit. The purprose of this message is to prove that 0x7cB57B5A97eAbe94205C07890BE4c1aD31E486A8 is my address." rows="4"></textarea>
      </div>

      <!-- Date -->
      <div class="form-group">
        <h4 translate="MSG_date"> Date </h4>
        <input class="form-control" ng-model="signMsg.dateTime" type="text" placeholder="1 JAN 2016 14:15" />
      </div>

      <!-- Wallet Decrypt -->
      <div class="form-group">
        <br />
        @@if (site === 'cx' )  {  <cx-wallet-decrypt-drtv></cx-wallet-decrypt-drtv>   }
        @@if (site === 'mew' ) {  <wallet-decrypt-drtv></wallet-decrypt-drtv>         }
        <br /><br />
      </div>

      <!-- Sign Message Button -->
      <div class="form-group">
        <a class="btn btn-info btn-block" ng-click="generateSignedMsg()" translate="NAV_SignMsg" ng-show="wallet!=null"> Sign Message </a>
      </div>

      <!-- Sign Message Status -->
      <div class="form-group" ng-bind-html="signMsg.status"></div>

      <!-- Signed Message -->
      <div class="form-group" ng-show="signMsg.signedMsg">
        <h4 translate="MSG_signature"> Signature </h4>
        <textarea class="form-control" rows="4" readonly>{{ signMsg.signedMsg }}</textarea>
      </div>

    </div>
<!-- / Sign Message Stuff -->



<!-- Verify Message Stuff -->

    <div class="col-xs-12" ng-switch-when="verifyView">

      <!-- Address -->
      <div class="form-group">
        <h4 translate="TOKEN_Addr"> Address </h4>
        <input class="form-control" ng-model="verifyMsg.address" type="text" placeholder="0x7cB57B5A97eAbe94205C07890BE4c1aD31E486A8" />
      </div>

      <!-- Signature -->
      <div class="form-group">
        <h4 translate="MSG_signature"> Signature </h4>
        <textarea class="form-control" ng-model="verifyMsg.signedMsg" rows="4"></textarea>
      </div>

      <!-- Verify Signature Message Button -->
      <div class="form-group">
        <a class="btn btn-info btn-block" ng-click="verifySignedMessage()" translate="MSG_verify" ng-show="wallet!=null"> Verify Message </a>
      </div>

      <!-- Verify Message Status -->
      <div class="form-group" ng-bind-html="verifyMsg.status"></div>

    </div>
<!-- / Verify Message Stuff -->

  </section>
</article>
<!-- / Send Transaction Page -->
