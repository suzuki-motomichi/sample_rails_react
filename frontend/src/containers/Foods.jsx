import React, { Fragment } from 'react';

// React Routerの場合matchオブジェクトを受け取り↓、
export const Foods = ({
  match // ←ここはprops
  }) => {
  return (
    <Fragment>
      フード一覧
      <p>
        {/* match.params.hogeのかたちでパラメーターを抽出する */}
        restaurantIdは {match.params.restaurantsId} です
      </p>
    </Fragment>
  )
}
