from tortoise.signals import pre_save, pre_delete, post_delete, post_save
from typing import List, Optional, Type
from tortoise import BaseDBAsyncClient
from models.user import User
import logging

logger = logging.getLogger(__name__)


@pre_save(User)
async def signal_pre_save(
    sender: "Type[User]", instance: User, using_db, update_fields
) -> None:
    pass


@post_save(User)
async def signal_post_save(
    sender: "Type[User]",
    instance: User,
    created: bool,
    using_db: "Optional[BaseDBAsyncClient]",
    update_fields: List[str],
) -> None:
    print('message_post_save: ', sender,
          instance, using_db, update_fields)


@pre_delete(User)
async def signal_pre_delete(
    sender: "Type[User]", instance: User, using_db: "Optional[BaseDBAsyncClient]"
) -> None:
    pass


@post_delete(User)
async def signal_post_delete(
    sender: "Type[User]", instance: User, using_db: "Optional[BaseDBAsyncClient]"
) -> None:
    pass
